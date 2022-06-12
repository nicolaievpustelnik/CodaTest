<?php

namespace App\Handler\Client;

/**
 * Description of Dashboard
 * 
 * @OA\Post(
 *     path="/client/dashboard",
 *     summary="Project dashboard",
 *     tags={"Client"},
 *     @OA\RequestBody(
 *         description="Object query",
 *         required=false,
 *         @OA\MediaType(
 *             mediaType="application/json",                 
 *             @OA\Schema(
 *             )
 *         )
 *     ),
 *     @OA\Response(
 *          response=200,
 *          description="successful operation",
 *          @OA\JsonContent(
 *              allOf={
 *                  @OA\Property(ref="#/components/schemas/MiaJsonResponse"),
 *                  @OA\Property(
 *                      property="response",
 *                      type="array",
 *                      @OA\Items(type="object", ref="#/components/schemas/Client")
 *                  )
 *              }
 *          )
 *     ),
 *     security={
 *         {"bearerAuth": {}}
 *     },
 * )
 *
 * @author NicolaievBrito
 */
class Dashboard extends \Mia\Auth\Request\MiaAuthRequestHandler
{
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function handle(\Psr\Http\Message\ServerRequestInterface $request): \Psr\Http\Message\ResponseInterface 
    {
        // Get item process
        $item = $this->getForCreatAtClient($request);

        var_dump($item);
        



        // Return response
        return new \Mia\Core\Diactoros\MiaJsonResponse($item->toArray());
    }
    
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \App\Model\Client
     */
    protected function getForCreatAtClient(\Psr\Http\Message\ServerRequestInterface $request)
    {

        // Search DB 
        $item = \App\Model\Client::fromQuery("select * from client where created_at BETWEEN date_add(NOW(), INTERVAL -7 DAY) AND NOW()");

        return $item->toArray();
        
    }
}