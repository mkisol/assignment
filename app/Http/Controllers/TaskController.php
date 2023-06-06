<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Http\Requests\{StoreTaskRequest, UpdateTaskRequest};
use Yajra\DataTables\Facades\DataTables;

class TaskController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:task view')->only('index', 'show');
        $this->middleware('permission:task create')->only('create', 'store');
        $this->middleware('permission:task edit')->only('edit', 'update');
        $this->middleware('permission:task delete')->only('destroy');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (request()->ajax()) {
            $tasks = Task::query();

            return DataTables::of($tasks)
                ->addColumn('action', 'tasks.include.action')
                ->toJson();
        }

        return view('tasks.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('tasks.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreTaskRequest $request)
    {
        
        Task::create($request->validated());

        return redirect()
            ->route('tasks.index')
            ->with('success', __('The task was created successfully.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function show(Task $task)
    {
        return view('tasks.show', compact('task'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function edit(Task $task)
    {
        return view('tasks.edit', compact('task'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateTaskRequest $request, Task $task)
    {
        
        $task->update($request->validated());

        return redirect()
            ->route('tasks.index')
            ->with('success', __('The task was updated successfully.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function destroy(Task $task)
    {
        try {
            $task->delete();

            return redirect()
                ->route('tasks.index')
                ->with('success', __('The task was deleted successfully.'));
        } catch (\Throwable $th) {
            return redirect()
                ->route('tasks.index')
                ->with('error', __("The task can't be deleted because it's related to another table."));
        }
    }

    public function assign($assignment_id)
    {
        $assignTasks = \App\Models\AssignTask::where('assignment_id', $assignment_id)->get();
        if ($assignTasks) {
            return view('tasks.assignTask', compact('assignTasks', 'assignment_id'));
        }
        else
        {
            $assignTasks = '';
            return view('tasks.assignTask', compact('assignment_id'));
        }
        
    }

}
