import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Field, reduxForm } from 'redux-form';
import { Button, Card, CardTitle, Col, CardText } from 'reactstrap';
import { Link } from 'react-router-dom';
import _ from 'lodash';

import * as projectActions from '../actions/project_actions'

class ProjectEdit extends Component {
  onSubmit(values, props) {
    this
      .props
      .actions
      .updateProject({id: this.props.project.id,
        business_name: values.business_name,
        contact_name: values.contact_name,
        contact_email: values.contact_email,
        contact_phone_num: values.contact_phone_num,
        long_desc: values.long_desc,
        short_desc: values.short_desc,
        is_capstone_worthy: values.is_capstone_worthy,
        is_paid: values.is_paid
      })
      this.props.history.push(`/projects/${this.props.project.id}`)
  }
  locations() {
    console.log(this.props)
    return _.mapKeys(this.props.locations, location => {
      return (
        <option value={location.id}>{location.name}</option>
      )
    })
  }
  render () {
    const { handleSubmit } = this.props;
    return (
      <div>
        <form onSubmit={handleSubmit(this.onSubmit.bind(this))}>
          {this.props.project &&
            <Col sm='4' md='4' lg='6'>
              <div>
                  Project Name:
                  <Field
                    name='proj_name'
                    component='input'
                    type='text'
                    placeholder={this.props.project.proj_name}
                  />
                  Business Name: <Field name='business_name' component='input' type='text' placeholder={this.props.project.business_name} />
                Location:
                  <Field
                    name='location_id'
                    component='select'
                  >
                    <option />
                    <option value='1'>Austin</option>
                    <option value='2'>Denver</option>
                  </Field>
                <br/>
              <Button color='info' type='submit'>Submit</Button>
              <Link to={`/projects/${this.props.project.id}`}>
                <Button color='warning'>Cancel</Button>
              </Link>
              </div>
            </Col>}
        </form>
      </div>
    )
  }
}

const mapStateToProps = (state, props) => {
  return {
    project: state.projects[props.match.params.id],
    locations: state.locations
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    actions: bindActionCreators(projectActions, dispatch)
  }
}

const Proj = reduxForm({form: 'editProject'})(ProjectEdit)

export default connect(mapStateToProps, mapDispatchToProps)(Proj);
