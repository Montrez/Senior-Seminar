import React from 'react';
import CurrencyFormat from 'react-currency-format';
import PropTypes from 'prop-types';
import axios from 'axios';

export default class Request extends React.Component {
  handleStatusChange = (e) => {
    console.log('all good 1')
    let temp = parseInt(this.props.request.status);
    console.log('all good 2')
    temp ? temp=0 : temp=1
    console.log('all good 3')
    this.props.request.status = temp.toString();
    console.log('all good 4')
    this.setState({status: temp});
    console.log('all good 5')
    this.props.handleStatusChange(this.props.request.id);
    console.log('all good 6')
  };


  state = {
    status : 0,
  }

  static propTypes = {
    department: PropTypes.string,
    percentrequested: PropTypes.number,
    status: PropTypes.number
  };

  render = () => {
    return(
      <tr className="spa_entry">
        <td>{this.props.request.expense_type}</td>
        <td>{this.props.request.destination}</td>
        <td>
      <CurrencyFormat decimalScale={2} value={this.props.request.amount_from_total} displayType={'text'} thousandSeparator={true} prefix={'$'} />
        </td>
        <td dangerouslySetInnerHTML={{__html: this.props.request.department}}></td>
        <td>{Number(this.props.request.status) ? 'Approved' : 'Pending'}</td>
        <td>
           <a className="btn btn-outline-primary" onClick={this.handleStatusChange} >
              Toggle Status
           </a>
        </td>
      </tr>
    )
  };


  componentDidMount = () => {
    console.log('\n\nthe request component mounted:')
    console.log(this)
  }
}
