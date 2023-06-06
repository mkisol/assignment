<?php

namespace App\Http\Controllers;

use App\Models\AssignTask;
use App\Http\Requests\{StoreAssignTaskRequest, UpdateAssignTaskRequest};
use Yajra\DataTables\Facades\DataTables;
use App\Models\Task;
use App\Models\User;

class AssignTaskController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:assign task view')->only('index', 'show');
        $this->middleware('permission:assign task create')->only('create', 'store');
        $this->middleware('permission:assign task edit')->only('edit', 'update');
        $this->middleware('permission:assign task delete')->only('destroy');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (request()->ajax()) {
            $assignTasks = AssignTask::query();

            return DataTables::of($assignTasks)
            ->addColumn('user_id', function ($row) {
                $user_id = User::where('id',$row->user_id)->pluck('name')->first();
                return $user_id;
            })
            ->addColumn('assignment_id', function ($row) {
                $assignment_id = Task::where('id',$row->assignment_id)->pluck('title')->first();
                return $assignment_id;
            })
             ->addColumn('status', function ($row) {
               if($row->status == '0')
               {
                   $status = 'Not Startted';
               }elseif ($row->status == '1') {
                   $status = 'In Progress';
               }
               else
               {
                $status = 'Complete';
               }
               return $status;

            })
                ->addColumn('action', 'assign-tasks.include.action')
                ->toJson();
        }

        return view('assign-tasks.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('assign-tasks.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreAssignTaskRequest $request)
    {
        $selectedUserIds = $request->input('user_ids');

        foreach ($selectedUserIds as $userId) {
            $existingRecord = AssignTask::where('assignment_id', $request->input('assignment_id'))
                ->where('user_id', $userId)
                ->exists();

            if (!$existingRecord) {
                AssignTask::create([
                    'assignment_id' => $request->input('assignment_id'),
                    'user_id' => $userId,
                    'status' => '0',
                ]);
            }
        }
        return redirect()
            ->route('assign-tasks.index',['assignment_id'=>$request->input('assignment_id')])
            ->with('success', __('The assignTask(s) were created successfully.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AssignTask  $assignTask
     * @return \Illuminate\Http\Response
     */
    public function show(AssignTask $assignTask)
    {
        return view('assign-tasks.show', compact('assignTask'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AssignTask  $assignTask
     * @return \Illuminate\Http\Response
     */
    public function edit(AssignTask $assignTask)
    {
        return view('assign-tasks.edit', compact('assignTask'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AssignTask  $assignTask
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAssignTaskRequest $request, AssignTask $assignTask)
    {
        
        $assignTask->update($request->validated());

        return redirect()
            ->route('assign-tasks.index')
            ->with('success', __('The assignTask was updated successfully.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AssignTask  $assignTask
     * @return \Illuminate\Http\Response
     */
    public function destroy(AssignTask $assignTask)
    {
        try {
            $assignTask->delete();

            return redirect()
                ->route('assign-tasks.index')
                ->with('success', __('The assignTask was deleted successfully.'));
        } catch (\Throwable $th) {
            return redirect()
                ->route('assign-tasks.index')
                ->with('error', __("The assignTask can't be deleted because it's related to another table."));
        }
    }
}
