<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Requests\Backend\Jobposts\DeleteJobpostRequest;
use App\Http\Requests\Backend\Jobposts\ManageJobpostRequest;
use App\Http\Requests\Backend\Jobposts\StoreJobpostRequest;
use App\Http\Requests\Backend\Jobposts\UpdateJobpostRequest;
use App\Http\Resources\JobpostsResource;
use App\Models\Jobpost;
use App\Repositories\Backend\JobpostsRepository;
use Illuminate\Http\Response;

/**
 * @group Jobposts Management
 *
 * Class JobpostsController
 *
 * APIs for Jobposts Management
 *
 * @authenticated
 */
class JobpostController extends APIController
{
    /**
     * Repository.
     *
     * @var JobpostsRepository
     */
    protected $repository;

    /**
     * __construct.
     *
     * @param $repository
     */
    public function __construct(JobpostsRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * Get all Jobposts.
     *
     * This endpoint provides a paginated list of all Jobposts. You can customize how many records you want in each
     * returned response as well as sort records based on a key in specific order.
     *
     * @queryParam Jobpost Which Jobpost to show. Example: 12
     * @queryParam per_Jobpost Number of records per Jobpost. (use -1 to retrieve all) Example: 20
     * @queryParam order_by Order by database column. Example: created_at
     * @queryParam order Order direction ascending (asc) or descending (desc). Example: asc
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/Jobpost/Jobpost-list.json
     *
     * @param \Illuminate\Http\ManageJobpostRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(ManageJobpostRequest $request)
    { 
        //Jobpost List
        $empList = Jobpost::all();
        $empList = $empList->toArray();
        $empListArr = array();
        if($empList !=null){
            foreach($empList as $eData){ 
                $emp_id = $eData['id'];
                $emp_first_name = $eData['emp_first_name'];
                $emp_last_name = $eData['emp_last_name']; 
                $empListArr[$emp_id] = $emp_first_name.' '.$emp_last_name;
            }
        }
        $this->setStatusCode(200);
        return $this->respond($data,[]);
        // return response()->json([
        //     'emp_list' => $empListArr,
        //     'status' => 'success',
        //     'code'      =>  200,
        // ]);
    }

    
    /**
     * Gives a specific Jobpost.
     *
     * This endpoint provides you a single Jobpost
     * The Jobpost is identified based on the ID provided as url parameter.
     *
     * @urlParam id required The ID of the Jobpost
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/Jobpost/Jobpost-show.json
     *
     * @param ManageJobpostRequest $request
     * @param \App\Models\Jobpost $Jobpost
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(ManageJobpostRequest $request, Jobpost $Jobpost)
    { 
        $empDetails = $Jobpost->toArray();
        return response()->json([
            'emp_details' => $empDetails,
            'status' => 'success',
            'code'      =>  200,
        ]);
        //Jobpost Update
        // $id = '1';
        // $emp_first_name = 'fsfsfsfs';
        // Jobpost::where('id', $id)->update(['emp_first_name' => $emp_first_name]);

        //End Jobpost Update


        //Jobpost List
        // $empList = Jobpost::all();
        // $empList = $empList->toArray();
        // $empListArr = array();
        // if($empList !=null){
        //     foreach($empList as $eData){ 
        //         $emp_id = $eData['id'];
        //         $emp_first_name = $eData['emp_first_name'];
        //         $emp_last_name = $eData['emp_last_name']; 
        //         $empListArr[$emp_id] = $emp_first_name.' '.$emp_last_name;
        //     }
        // }
        // return response()->json([
        //     'emp_list' => $empListArr,
        //     'status' => 'success',
        //     'code'      =>  200,
        // ]);
        //End Jobpost List
        //return new JobpostsResource($empListArr);
    }

    /**
     * Create a new Jobpost.
     *
     * This endpoint lets you create new Jobpost
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile status=201 responses/Jobpost/Jobpost-store.json
     *
     * @param \App\Http\Requests\Backend\Jobposts\StoreJobpostRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(StoreJobpostRequest $request)
    { 
        $Jobpost = $this->repository->create($request->validated());

        return (new JobpostsResource($Jobpost))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    /**
     * Update Jobpost.
     *
     * This endpoint allows you to update existing Jobpost with new data.
     * The Jobpost to be updated is identified based on the ID provided as url parameter.
     *
     * @urlParam id required The ID of the Jobpost
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/Jobpost/Jobpost-update.json
     *
     * @param \App\Models\Jobpost $Jobpost
     * @param \App\Http\Requests\Backend\Jobposts\UpdateJobpostRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(UpdateJobpostRequest $request, Jobpost $Jobpost)
    { 
        // echo $request->emp_first_name;
        // echo $request->emp_first_name;
        // echo $request->emp_last_name;
        // $empDetails = $Jobpost->toArray();
        // dd($empDetails);
        $Jobpost = $this->repository->update($Jobpost, $request->validated());

        return new JobpostsResource($Jobpost);
    }

    /**
     * Delete Jobpost.
     *
     * This endpoint allows you to delete a Jobpost
     * The Jobpost to be deleted is identified based on the ID provided as url parameter.
     *
     * @urlParam id required The ID of the Jobpost
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile status=204 scenario="When the record is deleted" responses/Jobpost/Jobpost-destroy.json
     *
     * @param \App\Models\Jobpost $Jobpost
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(DeleteJobpostRequest $request, Jobpost $Jobpost)
    {
        $this->repository->delete($Jobpost);

        return response()->noContent();
    }
}
