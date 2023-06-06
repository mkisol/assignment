<div class="row mb-2">
    <div class="col-md-6">
        <div class="form-group">
            <label for="user-id">{{ __('User') }}</label>
            <select name="user_ids[]" id="user-ids" class="form-control @error('user_ids') is-invalid @enderror" multiple required>
                <?php  $users = App\Models\User::all();  ?>
           @foreach($users as $user)
                <option value="{{ $user->id }}" {{ (isset($assignTasks) && $assignTasks->contains('user_id', $user->id)) || in_array($user->id, old('user_ids', [])) ? 'selected' : '' }}>
                    {{ $user->name }}
                </option>
            @endforeach

        </select>

            @error('user_id')
                <span class="text-danger">
                    {{ $message }}
                </span>
            @enderror
        </div>
    </div>
<input type="hidden" name="assignment_id" value="{{$assignment_id}}">    <div class="col-md-6">
    </div>
</div>