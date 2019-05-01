import React from 'react';
import CurrencyFormat from 'react-currency-format';
import axios from 'axios';
import RequestList from './RequestList';

export default class Catalog extends React.Component {

  state = { 
    requests: [],
    budget: 0.0,
    id: 0
    //the id is never set until after at least one status is changed (i think)
  };

  handleStatusChange = (id) => {

    var self = this;

    axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";

    axios.put(
      '/requests/'+id+'/disapprove')
      .then(function (response) {
        console.log(response)
        //console.log('toggle status !! !  data\n');
        console.log(response.data);
        self.setState({ id: response.data.id });
        self.setState({ status: response.data.status });
        self.setState({ requests: response.data.requests });
        self.setState({ budget: response.data.budget });
      })
      .catch(function (error) {
        //alert('cannot toggle status.> ?: ', error);
      });
  };

  componentDidMount = () => {
    var self = this;
        self.setState({ budget : this.props.budget })
    console.log('here is the Catalog, is the budget there as a prop')
    console.log(this)
    axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
    axios.get('/')
      .then(function (response) {
        console.log('here is the response data, can we get the request ids from here?')
        console.log(response.data);
        self.setState({ requests: response.data })
      })
      .catch(function (error) {
        console.log(error);
      });
  };

  render = () => {
    return(
      <div className="container">
        <p> Budget Remaining : <CurrencyFormat decimalScale={2}  value={this.state.budget} displayType={'text'} thousandSeparator={true} prefix={'$'} />
      </p>
         <h3>You have {this.state.requests == null ? 0 : this.state.requests.length} requests. </h3>
      <br/><br/>
         <div className="row">
            <RequestList   requests={this.state.requests}
                  sort ={this.state.sort}
                  id={this.state.id}
                  order={this.state.order}
                  handleStatusChange={this.handleStatusChange}/>
         </div>
      </div>
    );
  };
}
