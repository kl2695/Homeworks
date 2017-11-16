import React from 'react';

import GiphysIndexItem from './giphys_index_item';


const GiphysIndex = ({giphys}) => {

        const giphyList = giphys.map(giphy =>(
            <GiphysIndexItem giphy={giphy}/> 
        ));

       return( <ul>
            {giphyList}
        </ul>
       )

   
}

export default GiphysIndex; 