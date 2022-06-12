<?php 

namespace App\Model;

/**
 * Class Client
 * @property string $firstname 
 * @property string $lastname 
 * @property string $email 
 * @property string $phone 
 * @property string $photo 
 * 
 * @author NicolaievBrito
 *
 */
class Client extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'client';

    /**
    * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
    */
    public function mia_user()
    {
        return $this->belongsTo(MiaUser::class, 'user_id');
    }


    protected static function boot(): void
    {
        parent::boot();
        
        static::addGlobalScope('exclude', function (\Illuminate\Database\Eloquent\Builder $builder) {
            $builder->where('client.deleted', 0);
        });
    }
}