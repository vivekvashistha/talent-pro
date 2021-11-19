<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class GeneralResourceCollection extends ResourceCollection
{
    /**
    * Create a new resource instance.
    *
    * @param  mixed  $resource
    * @return void
    */
    public function __construct($resource, $response_message = null, $response_status = null)
    {
        parent::__construct($resource);

        $this->standalone = is_int($response_message);

        $this->response_message = $response_message === null ? trans('validation.response.success') : $response_message;

        $this->response_status = $response_status === null ? trans('validation.status.success') : $response_status;
    }

    /**
    * Transform the resource into an array.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return array
    */
    public function toArray($request)
    {
        return $this->standalone ? $this->collection : [
            'status' => $this->response_status,
            'message' => $this->response_message,
            'data' => $this->collection
        ];
    }

    /**
     * Customize the response for a request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Illuminate\Http\JsonResponse  $response
     * @return void
     */
    public function withResponse($request, $response)
    {
        if ($this->response_status == trans('validation.status.error')) {

            $response->setStatusCode(400);

        }

        parent::withResponse($request, $response);
    }
}
