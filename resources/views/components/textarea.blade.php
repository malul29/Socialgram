<div class="row mb-3">
    <label for="{{$name}}" class="col-md-4 col-form-label text-md-end">{{$label}}</label>
<div class="col-md-6">
<textarea class="form-control textarea" name="{{$name}}" id="{{$name}}" placeholder="{{$placeholder ?? ''}}">
 @isset($object->{$name})
{{ old($name) ? old($name) : $object->{$name} }}
@else
{{ old($name) }}
@endisset
</textarea>
@if($errors->has($name))
<div class="invalid-feedback">
{{ $errors->first($name) }}
</div>
@endif
</div>
</div>
