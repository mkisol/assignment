@extends('layouts.app')

@section('title', __('Detail of Assign Tasks'))
<style type="text/css">
 .box-comments .box-comment {
    padding: 8px 5px;
    background-color: #eee;
    margin: 5px 0;
        border-bottom: 1px solid #eee;
}
.box-comments .comment-text {
    margin-left: 40px;
    color: #555;
}
.box-comments .username {
    color: #444;
    display: block;
    font-weight: 600;
}
.img-circle {
    border-radius: 50%;
}
.img-sm, .box-comments .box-comment img, .user-block.user-block-sm img {
    width: 30px!important;
    height: 30px!important;
}
</style>
@section('content')
    <div class="page-heading">
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-md-8 order-md-1 order-last">
                    <h3>{{ __('Assign Tasks') }}</h3>
                    <p class="text-subtitle text-muted">
                        {{ __('Detail of assign task.') }}
                    </p>
                </div>

                <x-breadcrumb>
                    <li class="breadcrumb-item">
                        <a href="/">{{ __('Dashboard') }}</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('assign-tasks.index') }}">{{ __('Assign Tasks') }}</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        {{ __('Detail') }}
                    </li>
                </x-breadcrumb>
            </div>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped">
                                    <tr>
                                            <td class="fw-bold">{{ __('User') }}</td>
                                            <?php $user = App\Models\User::where('id',$assignTask->user_id)->pluck('name')->first();   ?>
                                            <td>{{ $user }}</td>
                                        </tr>
									<tr>
                                            <td class="fw-bold">{{ __('Assignment') }}</td>
                                            <?php $assignment = App\Models\Task::where('id',$assignTask->assignment_id)->first();
                                              ?>
                                            <td>{{ $assignment->title }}</td>
                                        </tr>
                                        <tr>
                                            <td class="fw-bold">{{ __('Deadline') }}</td>
                                            <td>{{ $assignment->deadline }}</td>
                                        </tr>
									<tr>
                                            <td class="fw-bold">{{ __('Status') }}</td>
                                            <?php if($assignTask->status == '0')
                                                   {
                                                       $status = 'Not Startted';
                                                   }elseif ($assignTask->status == '1') {
                                                       $status = 'In Progress';
                                                   }
                                                   else
                                                   {
                                                    $status = 'Complete';
                                                   }  ?>
                                            <td>{{ $status }}</td>
                                        </tr>
                                    <tr>
                                        <td class="fw-bold">{{ __('Created at') }}</td>
                                        <td>{{ $assignTask->created_at->format('d/m/Y H:i') }}</td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">{{ __('Updated at') }}</td>
                                        <td>{{ $assignTask->updated_at->format('d/m/Y H:i') }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="m-2">
                            <h3 class="m-3">Comments</h3>
                             <?php $replies = App\Models\Comment::where('assign_task_id',$assignTask->id)->get();  ?>
                            @foreach($replies as $reply)
                            <div class="mb-4 box-comment box-comment-{{$reply->id}}" id="{{$reply->id}}">
                                <div class="row">
                                    <div class="col-1">
                                        <img class="img-circle img-sm" src="{{asset('no-pic.png')}}" alt="User Image">
                                    </div>
                                    <div class="col-8">                                
                                        <div class="comment-text">
                                            <span class="username">Super Admin
                                                <div class="text-muted pull-right " style="padding-left: 12px;">
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <span class="text-muted pull-right">{{$reply->created_at}}</span> 
                                        <a href="javascript:void(0)" onclick="deleteComment({{$reply->id}})" alt="delete">
                                          <i class="bi bi-trash" style="color:red;"></i>
                                        </a> 
                                    </div>
                                </div>
                                <div class="mt-2">
                                  {!! $reply->reply !!}
                                </div>
                               
                            </div>
                            @endforeach
                            <form class="form-horizontal mt-4" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="form-group margin-bottom-none">
                                    <div class="col-sm-12">
                                        <input type="file" name="files" id="file" style="display: none;">
                                        <i class="bi bi-paperclip" style="font-size: 38px;position: absolute;right: 3%;"></i>
                                        <textarea class="form-control input-sm" id="reply" placeholder="Response"></textarea>
                                        <br>
                                    </div>

                                    <div class="col-sm-3">
                                        <input type="hidden" id="user_id" value="{{auth()->user()->id}}">
                                        <input type="hidden" id="assign_task_id" value="{{$assignTask->id}}">
                                        <button type="button" id="savecomment" class="btn btn-danger pull-right btn-block btn-sm">Send</button>
                                    </div>
                                </div>
                            </form>
                            <a href="{{ url()->previous() }}" class="btn btn-secondary">{{ __('Back') }}</a>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection


@push('js')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).on('click','.bi-paperclip',function(){
            $('#file').trigger('click');
        })

        $(document).on('change','#file',function(){
            console.log('chnge');
            var formData = new FormData($('.form-horizontal')[0]);
            formData.append('reply'              ,$('#reply').val())
            formData.append('user_id'              ,$('#user_id').val())
            formData.append('assign_task_id'              ,$('#assign_task_id').val())

            $.ajax({
                url: '{{route("savecommentsFile")}}',
                type: 'POST',
                data: formData, // The form with the file inputs.
                processData: false,
                contentType: false  ,                  // Using FormData, no need to process data.
                success: function( data, textStatus, jQxhr ){

                    if(data == 'error') {
                        alert('error saving comment.');
                    }else
                    {
                          var commentBoxHTML =data;
    // Append the new container element to the end of the existing comments
$('.form-horizontal').prepend(commentBoxHTML);
                    $('#reply').val('');
                    $('#c_count').text($('.box-comment').length);
                    }
                    console.log('status', textStatus);
                },
            }).done(function(){
                console.log("Success: Files sent!");
            }).fail(function(){
                console.log("An error occurred, the files couldn't be sent!");
            });
        });
        $('#savecomment').click(function (e) {
        e.preventDefault();

        if($('#reply').val() == ''){
            alert('Please write your comment and submit.');
            return false;
        }


        var formData = {
            'reply'              : $('#reply').val(),
            'user_id'             : $("#user_id").val(),
            'assign_task_id'    : $("#assign_task_id").val()
        };

        $.ajax({
            url: '{{route("savecomments")}}',
             headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
            type: 'post',
            data: formData,
            success: function( data, textStatus, jQxhr ){
                console.log(data);
                if(data == 'error') {
                    alert('error saving comment.');
                }else{
                    var commentBoxHTML =data;
    // Append the new container element to the end of the existing comments
$('.form-horizontal').prepend(commentBoxHTML);
                    $('#reply').val('');
                    $('#c_count').text($('.box-comment').length);
                }
                console.log('status', textStatus);
            },
            error: function( jqXhr, textStatus, errorThrown ){
                console.log('status', textStatus);

            }
        });




    });

    function  deleteComment(id) {
       var url11 = '{{ route("commentDelete", ":id") }}';
        url11 = url11.replace(':id', id);

        $.ajax({
            url: url11,
            type: 'get',
            success: function( data, textStatus, jQxhr ){
                console.log(data);
                if(data == 1) {
                     $('.box-comment-'+id).hide('slow', function () {
                         $(this).remove();
                         $('#c_count').text($('.box-comment').length);
                     });

                }else{
                    alert('error deleting comment.');
                }
                console.log('status', textStatus);
            },
            error: function( jqXhr, textStatus, errorThrown ){
                console.log('status', textStatus);
            }
        });

    }
</script>
@endpush
