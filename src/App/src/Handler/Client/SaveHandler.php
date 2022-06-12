<?php

namespace App\Handler\Client;

/**
 * Description of SaveHandler
 * 
 * @OA\Post(
 *     path="/client/save",
 *     summary="Client save",
 *     tags={"Client"},
 *     @OA\RequestBody(
 *         description="Object query",
 *         required=false,
 *         @OA\MediaType(
 *             mediaType="application/json",                 
 *             @OA\Schema(
 *                  @OA\Property(
 *                      property="firstname",
 *                      type="string",
 *                      description="firstname",
 *                      example="Nicolaiev"
 *                  ),
 *                  @OA\Property(
 *                      property="lastname",
 *                      type="string",
 *                      description="lastname",
 *                      example="Brito"
 *                  ),
 *                  @OA\Property(
 *                      property="email",
 *                      type="string",
 *                      description="email",
 *                      example="nicolaievbrito@gmail.com"
 *                  ),
 *                  @OA\Property(
 *                      property="photo",
 *                      type="string",
 *                      description="photo",
 *                      example="Nico123.jpg"
 *                  ),
 *                  @OA\Property(
 *                      property="phone",
 *                      type="string",
 *                      description="phone",
 *                      example="1136228999"
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
class SaveHandler extends \Mia\Auth\Request\MiaAuthRequestHandler
{
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function handle(\Psr\Http\Message\ServerRequestInterface $request): \Psr\Http\Message\ResponseInterface 
    {
        // Get User
        $user = $this->getUser($request);

        // Get item process
        $item = $this->getForEdit($request);

        // Verify user role
        if($user->role == 2){

            // Verify exist client
            if($item != null){

                // Save data
                $item->firstname = $this->getParam($request, 'firstname', '');
                $item->lastname = $this->getParam($request, 'lastname', '');
                $item->email = $this->getParam($request, 'email', '');
                $item->photo = $this->getParam($request, 'photo', '');
                $item->phone = $this->getParam($request, 'phone', '');
                
                try {
                    $item->save();
                } catch (\Exception $exc) {
                    return new \Mia\Core\Diactoros\MiaJsonErrorResponse(-2, $exc->getMessage());
                }

            } else {

                return \App\Factory\ErrorFactory::existClient();
            }

        } else {
            
            return \App\Factory\ErrorFactory::userAuth();
        }

        // Return response
        return new \Mia\Core\Diactoros\MiaJsonResponse($item->toArray());
    }
    
    /**
     * 
     * @param \Psr\Http\Message\ServerRequestInterface $request
     * @return \App\Model\Client
     */
    protected function getForEdit(\Psr\Http\Message\ServerRequestInterface $request)
    {
        // Verify send fields
        $itemFirstname = $this->getParam($request, 'firstname', '');
        $itemLastname = $this->getParam($request, 'lastname', '');
        $itemEmail = $this->getParam($request, 'email', '');

        // Search DB 
        $item = \App\Model\Client::fromQuery("select * from client where firstname = '$itemFirstname' and lastname = '$itemLastname' and email = '$itemEmail'");

        $rows = count($item->toArray());

        // Verify exists
        if($rows > 0){

            return null;

        } else {

            return new \App\Model\Client();
        }
    }
}