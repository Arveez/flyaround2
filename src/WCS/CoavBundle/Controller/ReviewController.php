<?php

namespace WCS\CoavBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use WCS\CoavBundle\Entity\Review;
use WCS\CoavBundle\Form\ReviewType;

/**
 * Class ReviewController
 * @Route("review")
 */
class ReviewController extends Controller
{
    /**
     * @Route("/")
     * @Method("GET")
     */
    public function indexAction()
    {
        return $this->render('Review/index.html.twig', array(
            // ...
        ));
    }

    /**
     * @Route("/new")
     */
    public function newAction(Request $request)
    {

        $review = new Review();

        $form = $this->createForm(ReviewType::class, $review);

        return $this->render('Review/new.html.twig', array(
            'form' => $form->createView()
        ));
    }

}
