<?php

namespace App\Repository;

use \Illuminate\Database\Capsule\Manager as DB;

/**
 * Description of ClientRepository
 *
 * @author NicolaievBrito
 */
class ClientRepository 
{
    /**
     * 
     * @param \Mia\Database\Query\Configure $configure
     * @return \Illuminate\Pagination\Paginator
     */
    public static function fetchByConfigure(\Mia\Database\Query\Configure $configure)
    {
        $query = \App\Model\Client::select('client.*');
        
        // Order by query DESC
        if(!$configure->hasOrder()){
            $query->orderByRaw('id DESC');
        }

        // Get field query
        $search = $configure->getSearch();

        if($search != ''){
            
            $values = $search . '|' . implode('|', explode(' ', $search));
            
            // Set where for value
            $query->whereRaw('(firstname REGEXP ? OR lastname REGEXP ? OR email REGEXP ?)', [$values, $values, $values]);
            
        }
        
        // Process params
        $configure->run($query);

        return $query->paginate($configure->getLimit(), ['*'], 'page', $configure->getPage());
    }
}
