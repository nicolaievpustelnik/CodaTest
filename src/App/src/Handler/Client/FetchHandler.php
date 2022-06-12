<?php

namespace App\Handler\Client;

/**
 * Description of FetchHandler
 * 
 * @OA\Get(
 *     path="/client/fetch/{id}",
 *     summary="Client Fetch",
 *     tags={"Client"},
 *     @OA\Parameter(
 *         name="id",
 *         description="Id of Item",
 *         required=true,
 *         in="path",
 *         type="integer",
 *         example="1"
 *     ),
 *     @OA\Response(
 *          response=200,
 *          description="successful operation",
 *          @OA\JsonContent(ref="#/components/schemas/Client")
 *     ),
 *     security={
 *         {"bearerAuth": {}}
 *     }
 * )
 *
 * @author NicolaievBrito
 */
class FetchHandler extends \Mia\Auth\Request\MiaAuthRequestHandler
{
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function handle(\Psr\Http\Message\ServerRequestInterface $request): \Psr\Http\Message\ResponseInterface
    {
        // Verify send ID
        $itemId = $this->getParam($request, 'id', '');

        // Search DB 
        $item = \App\Model\Client::find($itemId);

        // Verify exists
        if($item === null){
            return \App\Factory\ErrorFactory::notExist();
        }
        // Return response
        return new \Mia\Core\Diactoros\MiaJsonResponse($item->toArray());
    }
}