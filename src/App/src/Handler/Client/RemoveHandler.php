<?php

namespace App\Handler\Client;

/**
 * Description of RemoveHandler
 * 
 * @OA\Get(
 *     path="/client/remove/{id}",
 *     summary="Client Revove",
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
 *          @OA\JsonContent(ref="#/components/schemas/MiaJsonResponse")
 *     ),
 *     security={
 *         {"bearerAuth": {}}
 *     },
 * )
 *
 * @author NicolaievBrito
 */
class RemoveHandler extends \Mia\Auth\Request\MiaAuthRequestHandler
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

        // Modify status remove
        $item->deleted = 1;
        $item->save();

        // Return response
        return new \Mia\Core\Diactoros\MiaJsonResponse(true);
    }
}