<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\post;
use App\Models\Comment;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function toggle($type, $object_id)
    {
        if($type == "POST"){
            $object = Post::findOrFail($object_id);
        } else {
            $object = Comment::findOrFail($object_id);
        }

        $attr = ['user_id' => Auth::user()->id];

        if($object->likes()->where($attr)->exists()){
            $object->likes()->where($attr)->delete(); 
            $msg = ['status' => 'UNLIKE'];
        } else {
            $object->likes()->create($attr);
            $msg = ['status' => 'LIKE'];
            
        }
        return response()->json($msg);
    }
}
