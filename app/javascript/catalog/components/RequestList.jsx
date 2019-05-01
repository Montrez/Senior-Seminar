import React from 'react';
import Request from './Request';


export default class RequestList extends React.Component {
  
  state = { 
  }


  handleStatusChange = (id) =>{
    this.props.handleStatusChange(id);
  }; 



  render = () => {
    var self = this;
    var requests = [];
    this.props.requests.forEach(function(request) {
      requests.push(<Request request={request}
                       id={self.state.id}
                       key={'request' + request.id}
                       handleStatusChange={self.handleStatusChange} />);
      }
    );


    return(
      <table className="table table-striped shadow" width="auto" style={{backgroundColor: "#FFFFFF"}}>
        <thead>
          <tr>
            <th scope="col">Request Type</th>
            <th scope="col">Destination</th>
            <th scope="col">Total Requested</th>
            <th scope="col">Department</th>
            <th scope="col">Status</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
          {requests}
        </tbody>
      </table>
    )
  }
}
