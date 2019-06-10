<?php

namespace App\Form;

use App\Entity\Advert;
use App\Entity\Category;
use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;


class AdvertType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title',  null, ['attr' => ['class' => 'form-control', 'style' => 'width:320px; margin:auto'], 
                                   'label' => 'Titre'])
            ->add('price',  null, ['attr' => ['class' => 'form-control', 'style' => 'width:320px; margin:auto'],
                                   'label' => 'Prix (€)'])
            ->add('place',  null, ['attr' => ['class' => 'form-control', 'style' => 'width:320px; margin:auto'],
                                   'label' => 'Ville'])
            ->add('description',  null, ['attr' => ['class' => 'form-control', 'style' => 'width:400px; margin:auto', 'rows' => '5']])
            
            ->add('photo',  FileType::class, ['attr' => ['class' => 'form-control-file', 'style' => 'width:320px; margin:auto'],
                                   'label' => 'Photo (format JPEG uniquement)'])
            ->add('category',  EntityType::class, ['attr' => ['class' => 'form-control', 'style' => 'width:320px; margin:auto'],
                                      'label' => 'Catégorie', 'class' => Category::class, 'choice_label' => 'name']);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Advert::class,
        ]);
    }
}
