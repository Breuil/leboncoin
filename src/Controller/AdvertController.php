<?php

namespace App\Controller;

use App\Entity\Advert;
use App\Entity\User;
use App\Form\AdvertType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use App\Service\AdvertService;

class AdvertController extends AbstractController
{

    public function __construct( AdvertService $adService ) {
        $this->adService = $adService;
    }



    /**
     * @Route("ads", name="ad_list")
     */
    public function list( Request $request) 
    {
        $query = $request->query->get('search');
        $sort = $request->query->get('sort');

        if ( $query !== NULL ) {
            return $this->render('advert/index.html.twig', array(
                'adverts' => $this->adService->findByName($query, $sort),
                'search' => $query
                )
            );
        }
        return $this->render( 'advert/index.html.twig', array(
            'adverts' => $this->adService->getAll(),
            'search' => ''
            )
        );
    }


    /**
     * @Route("ad/add", name="ad_add")
     */
    public function addAdvert( Request $request)
    {
        $advert = new Advert();
        $form = $this->createForm( AdvertType::class, $advert);
        

        $form->handleRequest( $request );
        if($form->isSubmitted() && $form->isValid()){
            
            $am = $this->getDoctrine()->getManager();
            $advert->setDate( new \DateTime() );
            $ruser = $am->getRepository('App:User')->findOneBy( array() );
            $advert->setOwner( $ruser );

            //Get the uploaded pic
            /** @var Symfony\Component\HttpFoundation\File\UploadedFile $pic */
            $pic = $form->get('photo')->getData();
            $picName = $this->generateUniqueFileName().'.'.$pic->guessExtension();

            try {
                $pic->move(
                    'img',
                    $picName
                );
            } catch (FileException $e) {
                echo ("Une erreur est survenue lors du transfert de l'image, veuillez réessayer.");
            }

            $advert->setPhoto($picName);

            $am->persist( $advert );
            $am->flush();
            return $this->redirectToRoute( 'ad_show', 
            ['id' => $advert->getId()]);
        }

        return $this->render('advert/create.html.twig', array(
            'form' => $form->createView(),
            )
        );   
    }

        /**
     * @Route("ad/{id}", name="ad_show", requirements = {"id" = "\d+"})
     */
    public function show( $id ) 
    {
        return $this->render( 'advert/show.html.twig', array(
            'advert' => $this->adService->getOne($id)
            )
        );
    }

    private function generateUniqueFileName()
    {
        return md5(uniqid());
    }

}
