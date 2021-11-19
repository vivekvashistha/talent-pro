<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Requests\Backend\Candidates\DeleteCandidateRequest;
use App\Http\Requests\Backend\Candidates\ManageCandidateRequest;
use App\Http\Requests\Backend\Candidates\StoreCandidateRequest;
use App\Http\Requests\Backend\Candidates\UpdateCandidateRequest;
use App\Http\Resources\CandidatesResource;
use App\Models\Candidate;
use App\Repositories\Backend\CandidatesRepository;
use Illuminate\Http\Response;

/**
 * @group Candidates Management
 *
 * Class CandidatesController
 *
 * APIs for Candidates Management
 *
 * @authenticated
 */
class CandidatesController extends APIController
{
    /**
     * Repository.
     *
     * @var CandidatesRepository
     */
    protected $repository;

    /**
     * __construct.
     *
     * @param $repository
     */
    public function __construct(CandidatesRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * Get all Candidates.
     *
     * This endpoint provides a paginated list of all Candidates. You can customize how many records you want in each
     * returned response as well as sort records based on a key in specific order.
     *
     * @queryParam Candidate Which Candidate to show. Example: 12
     * @queryParam per_Candidate Number of records per Candidate. (use -1 to retrieve all) Example: 20
     * @queryParam order_by Order by database column. Example: created_at
     * @queryParam order Order direction ascending (asc) or descending (desc). Example: asc
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/Candidate/Candidate-list.json
     *
     * @param \Illuminate\Http\ManageCandidateRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(ManageCandidateRequest $request)
    { 
        //Candidate List
        $empList = Candidate::all();
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
     * Gives a specific Candidate.
     *
     * This endpoint provides you a single Candidate
     * The Candidate is identified based on the ID provided as url parameter.
     *
     * @urlParam id required The ID of the Candidate
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/Candidate/Candidate-show.json
     *
     * @param ManageCandidateRequest $request
     * @param \App\Models\Candidate $Candidate
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(ManageCandidateRequest $request, Candidate $Candidate)
    { 
        //$empDetails = $Candidate->toArray();
        $resp = \App\Models\Auth\User::find($candidate)->toArray();
        return response()->json([
            'candidate_details' => $resp,
            'status' => 'success',
            'code'      =>  200,
        ]);
        //Candidate Update
        // $id = '1';
        // $emp_first_name = 'fsfsfsfs';
        // Candidate::where('id', $id)->update(['emp_first_name' => $emp_first_name]);

        //End Candidate Update


        //Candidate List
        // $empList = Candidate::all();
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
        //End Candidate List
        //return new CandidatesResource($empListArr);
    }

    /**
     * Create a new Candidate.
     *
     * This endpoint lets you create new Candidate
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile status=201 responses/Candidate/Candidate-store.json
     *
     * @param \App\Http\Requests\Backend\Candidates\StoreCandidateRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(StoreCandidateRequest $request)
    { 
        $Candidate = $this->repository->create($request->validated());

        return (new CandidatesResource($Candidate))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }

    /**
     * Update Candidate.
     *
     * This endpoint allows you to update existing Candidate with new data.
     * The Candidate to be updated is identified based on the ID provided as url parameter.
     *
     * @urlParam id required The ID of the Candidate
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/Candidate/Candidate-update.json
     *
     * @param \App\Models\Candidate $Candidate
     * @param \App\Http\Requests\Backend\Candidates\UpdateCandidateRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(UpdateCandidateRequest $request, Candidate $Candidate)
    { 
        // echo $request->emp_first_name;
        // echo $request->emp_first_name;
        // echo $request->emp_last_name;
        // $empDetails = $Candidate->toArray();
        // dd($empDetails);
        $Candidate = $this->repository->update($Candidate, $request->validated());

        return new CandidatesResource($Candidate);
    }

    /**
     * Delete Candidate.
     *
     * This endpoint allows you to delete a Candidate
     * The Candidate to be deleted is identified based on the ID provided as url parameter.
     *
     * @urlParam id required The ID of the Candidate
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile status=204 scenario="When the record is deleted" responses/Candidate/Candidate-destroy.json
     *
     * @param \App\Models\Candidate $Candidate
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(DeleteCandidateRequest $request, Candidate $Candidate)
    {
        $this->repository->delete($Candidate);

        return response()->noContent();
    }
}
