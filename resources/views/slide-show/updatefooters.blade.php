@extends('master')

@section('content')
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h3>CẬP NHẬT FOOTER</h3>
</div>

@if(session('Error'))
    <div class="alert alert-danger d-flex align-items-center" role="alert">
        <div>
            {{ session('Error') }}
        </div>
    </div>
@endif

<form method="POST" action="{{ route('slide-show.footer-update', ['id' => $footer->id]) }}">
    @csrf
    @method('PUT')

    <div class="row">
        <div class="col-md-6">
            <label for="address" class="form-label">Địa chỉ:</label>
            <input type="text" class="form-control" name="address" value="{{ old('address', $footer->address) }}" />
        </div>
        @error('address')
            <span class="error-message">{{ $message }}</span>
        @enderror
    </div>

    <div class="row">
        <div class="col-md-6">
            <label for="description" class="form-label">Mô tả:</label>
            <textarea class="form-control" name="description">{{ old('description', $footer->description) }}</textarea>
        </div>
        @error('description')
            <span class="error-message">{{ $message }}</span>
        @enderror
    </div>

    <div class="row">
        <div class="col-md-6">
            <label for="social_link" class="form-label">Liên kết xã hội:</label>
            <input type="url" class="form-control" name="social_link"
                value="{{ old('social_link', $footer->social_link) }}" />
        </div>
        @error('social_link')
            <span class="error-message">{{ $message }}</span>
        @enderror
    </div>

    <div class="row">
        <div class="col-md-6">
            <label for="contact" class="form-label">Liên hệ:</label>
            <input type="text" class="form-control" name="contact" value="{{ old('contact', $footer->contact) }}" />
        </div>
        @error('contact')
            <span class="error-message">{{ $message }}</span>
        @enderror
    </div>

    <div class="col-md-2 mt-3">
        <button type="submit" class="btn btn-primary">Lưu</button>
    </div>
</form>

@endsection