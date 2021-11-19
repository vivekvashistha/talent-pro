<?php

namespace App\Http\Resources;

use Illuminate\Container\Container;
use Illuminate\Contracts\Support\Arrayable;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Resources\Json\JsonSerializable;

class GeneralResource extends JsonResource
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
     * Resolve the resource to an array.
     *
     * @param  \Illuminate\Http\Request|null  $request
     * @return array
     */
    public function resolve($request = null)
    {
        $data = $this->toArray(
            $request = $request ?: Container::getInstance()->make('request')
        );

        if (!$this->standalone) {
            $base = $this->additional($request);
            $base['data'] = $data;
            $data = $base;
        }

        if ($data instanceof Arrayable) {
            $data = $data->toArray();
        } elseif ($data instanceof JsonSerializable) {
            $data = $data->jsonSerialize();
        }

        return $data = $this->filter((array) $data);
    }

    /**
    * Transform the resource into an array.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return array
    */
    public function additional($request)
    {
        return [
            'status' => $this->response_status,
            'message' => $this->response_message
        ];
    }
}
