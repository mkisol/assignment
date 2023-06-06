<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Http\Request;
use Image;
use App\Models\User;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:comment view')->only('index', 'show');
        $this->middleware('permission:comment create')->only('create', 'store');
        $this->middleware('permission:comment edit')->only('edit', 'update');
        $this->middleware('permission:comment delete')->only('destroy');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
        public function SaveComment(Request $request)
    {
        $reply = new Comment;
        
        $reply->user_id = $request->user_id;
        $reply->assign_task_id = $request->assign_task_id;
        $reply->reply = $request->reply;
          $reply->save();

        $user = User::findorfail($request->user_id)->pluck('name')->first();
        // Assuming you have a method to retrieve the comment's associated user and thread
        // $user = $comment->user;

        // Build the comment box HTML using the comment_box.blade.php view
        $commentBox = view('assign-tasks.include.comment_box', compact('reply', 'user'))->render();

        return response()->json($commentBox);        
    }
    public function DeleteComment($id)
    {
        $comment = Comment::findorfail($id);
        $comment->delete();
        return response()->json(1);
    }

    // public function GetComment($forum_id,$Reply_id)
    // {
    //     $reply = ThreadReply::where('thread_id',$forum_id)->where('id',$Reply_id+1)->first();
    //     if($reply)
    //     {
    //          $user = User::findorfail($reply->user_id)->pluck('name')->first();
    //          $commentBox = view('forums.include.comment_box', compact('reply', 'user'))->render();
    //          return response()->json($commentBox); 
    //     }
    //     else
    //     {
    //         return response()->json(0);
    //     }
    // }

    public function savecommentsFile(Request $request)
    {
        $reply = new Comment;

        $reply->user_id = $request->user_id;
        $reply->assign_task_id = $request->assign_task_id;

        if ($request->hasFile('files')) {
            $file = $request->file('files');
            $path = public_path('/uploads/');

            if (!file_exists($path)) {
                mkdir($path, 0777, true);
            }

            // Initialize an empty array for storing filenames
            $extension = $file->getClientOriginalExtension();
            $filename = $file->hashName();

            // Check if the file is an image
            if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'bmp'])) {
                // Resize and save the image
                Image::make($file->getRealPath())->resize(500, 500, function ($constraint) {
                    $constraint->upsize();
                    $constraint->aspectRatio();
                })->save($path . $filename);
            } else {
                // Save the document file without resizing
                $file->move($path, $filename);
            }

            $reply->reply = '<a href="' . asset("uploads/" . $filename) . '">' . $filename . '</a>';
        }

        $reply->save();

    }
}
