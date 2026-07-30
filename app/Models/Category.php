<?php

namespace App\Models;

use App\Models\Item;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $fillable = ['name','image' ,'is_active'];

    public function scopeSalesCategories($query)
    {
        return $query->whereIn('id',[1,2,3,4]);
    }

    public function items()
    {
        return $this->hasMany(Item::class);
    }

}
