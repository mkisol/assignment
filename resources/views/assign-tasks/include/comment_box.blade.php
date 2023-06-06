<div class="box-comment box-comment-{{$reply->id}}" id="{{$reply->id}}">
    <div class="row">
        <div class="col-1">
            <img class="img-circle img-sm" src="http://tpms.smart-track.online/assets/uploads/user_profile/no-pic.png" alt="User Image">
        </div>
        <div class="col-8">                                
            <div class="comment-text">
                <span class="username">{{$user}}
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