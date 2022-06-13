<?php

namespace App\Handler\Client;

/**
 * Description of Dashboard
 * 
 * @OA\Get(
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
        $clients = $this->getForCreatAtClient($request);
        $forClient = null;

        if (count($clients) > 0) {
            
            $forClient = new \App\Model\Client();
    
            foreach ($clients as $i => $client) {
    
                $arrayForClient[$i] = [
                    $client['create_at'] => $client['count_client']
                ];
                
            }
    
            $forClient->clients = $arrayForClient;

        } else {

            return \App\Factory\ErrorFactory::notClientsForCreateAt();
        }


        // Return response
        return new \Mia\Core\Diactoros\MiaJsonResponse($forClient->toArray());
    }
    
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \App\Model\Client
     */
    protected function getForCreatAtClient(\Psr\Http\Message\ServerRequestInterface $request)
    {

        // Search DB 
        $item = \App\Model\Client::fromQuery(
            "SELECT DATE(created_at) AS create_at, COUNT(created_at) AS count_client 
            FROM client 
            WHERE created_at BETWEEN DATE_ADD(NOW(), INTERVAL -7 DAY) AND NOW()
            GROUP BY DATE(created_at)
            HAVING COUNT(created_at) > 0"
        );

        return $item->toArray();
        
    }
}