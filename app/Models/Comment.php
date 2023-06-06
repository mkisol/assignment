<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = ['assign_task_id', 'user_id', 'reply'];

    /**
     * The attributes that should be cast.
     *
     * @var string[]
     */
    protected $casts = ['assign_task_id' => 'integer', 'user_id' => 'integer', 'reply' => 'string', 'created_at' => 'datetime:d/m/Y H:i', 'updated_at' => 'datetime:d/m/Y H:i'];

    

}
