<?php
/**
 * Created by PhpStorm.
 * User: rv
 * Date: 20/01/18
 * Time: 14:50
 */

namespace WCS\CoavBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;



class ReviewType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {

        $builder
            ->add('text', null, array('label' => 'Votre commentaire'))
            ->add('ratedUser',null, array('label' => 'Cible'))
            ->add('author', null, array('label' => 'Auteur'))
            ->add('publicationDate', DateTimeType::class, array('label' => 'Date'))
            ->add('note', IntegerType::class)
            ->add('save', SubmitType::class, array('label' => 'Soumettre'))
        ;

    }

}