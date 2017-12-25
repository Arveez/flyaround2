<?php

namespace WCS\CoavBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

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
     * @Method("POST")
     */
    public function newAction()
    {
        return $this->render('Review/new.html.twig', array(
            // ...
        ));
    }

}
