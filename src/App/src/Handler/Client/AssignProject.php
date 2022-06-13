<?php

namespace App\Handler\Client;

/**
 * Description of AssignProject
 * 
 * @OA\Post(
 *     path="/client/assign-project",
 *     summary="Project assign-project",
 *     tags={"Project"},
 *     @OA\RequestBody(
 *         description="Object query",
 *         required=false,
 *         @OA\MediaType(
 *             mediaType="application/json",                 
 *             @OA\Schema(
 *                  @OA\Property(
 *                      property="client_id",
 *                      type="int",
 *                      description="client_id",
 *                      example="1"
 *                  ),
 *                  @OA\Property(
 *                      property="title",
 *                      type="string",
 *                      description="title",
 *                      example="Good Code"
 *                  ),
 *                  @OA\Property(
 *                      property="caption",
 *                      type="string",
 *                      description="caption",
 *                      example="The best code with good practices"
 *                  )
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
 *                      @OA\Items(type="object", ref="#/components/schemas/Project")
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
class AssignProject extends \Mia\Auth\Request\MiaAuthRequestHandler
{
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function handle(\Psr\Http\Message\ServerRequestInterface $request): \Psr\Http\Message\ResponseInterface 
    {
        // Get item process
        $itemProject = $this->getForEditForClient($request);

        $clientId = $this->getParam($request, 'client_id', '');

        $itemClient = \App\Model\Client::find($clientId);

        if ($itemClient != null) {

            if ($itemProject != null) { 

                // Save data
                $itemProject->client_id = $clientId;
                $itemProject->title = $this->getParam($request, 'title', '');
                $itemProject->caption = $this->getParam($request, 'caption', '');

                try {

                    $itemProject->save();

                } catch (\Exception $exc) {
                    
                    return new \Mia\Core\Diactoros\MiaJsonErrorResponse(-2, $exc->getMessage());
                } 
            
            } else {

                return \App\Factory\ErrorFactory::existProjectForClient();
            }

        } else {

            return \App\Factory\ErrorFactory::notExistClient();
        }
        

        // Return response
        return new \Mia\Core\Diactoros\MiaJsonResponse($itemProject->toArray());
    }
    
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \App\Model\Project
     */
    protected function getForEditForClient(\Psr\Http\Message\ServerRequestInterface $request)
    {

        // Verify send fields
        $itemClientId = $this->getParam($request, 'client_id', '');
        $itemTitle = $this->getParam($request, 'title', '');
        $itemCaption = $this->getParam($request, 'caption', '');

        // Search DB 
        $item = \App\Model\Project::fromQuery("select * from project where client_id = '$itemClientId' and title = '$itemTitle' and caption = '$itemCaption'");

        $rows = count($item->toArray());

        // Verify exists
        if($rows > 0){

            return null;

        } else {

            return new \App\Model\Project();
        }
        
    }
}