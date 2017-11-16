import React from 'react';

import GiphysIndex from './giphys_index';


class GiphysSearch extends React.Component{
    constructor(props){
        super(props); 
        this.state = {
            searchTerm: ""
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleChange = this.handleChange.bind(this);
    }

    handleSubmit(event){
        event.preventDefault(); 
        this.props.fetchSearchGiphys(this.state.searchTerm)
    }

    handleChange(event){
        this.setState({searchTerm: event.target.value})
    }

    render(){


        return(
            <div>
                <h1>Search</h1>
                <form onSubmit={this.handleSubmit}>
                    <input onChange={this.handleChange}type="text"/>
                    <input type="submit"/>
                </form>
                <GiphysIndex giphys={this.props.giphys}/>
            </div>
        );
    }


}

export default GiphysSearch;