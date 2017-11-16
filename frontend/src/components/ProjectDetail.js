import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Card, CardBody, CardText, CardTitle, CardSubtitle, Button } from 'reactstrap'
import * as projectActions from '../actions/project_actions';
import _ from 'lodash';

class ProjectDetail extends Component {
  updateHistory() {
    this.props.history.push(`/projects/`);
  }

  render() {
    console.log('PROPS', this)
    return (
      <div>
        {this.props.project && <Card>
          <CardTitle>{this.props.project.proj_name}</CardTitle>
          <CardSubtitle>
            <Link to={`/projects/edit/${this.props.project.id}`}>
              Edit
            </Link>
          </CardSubtitle>
          <CardBody>
            <CardText>
              {this.props.project.business_name}<br/>
              <br/>
              {this.props.project.long_desc}
            </CardText>
            <div style={{display: "inlineBlock"}}>
              <div>
                Email:
                <a href="mailto:email">
                  {this.props.project.contact_name}
                </a>
              </div>
              <div>
                Phone: {this.props.project.contact_phone_num}
              </div>
            </div>
          </CardBody>
        </Card>}
      </div>
    );
  }
}

const mapStateToProps = (state, props) => {
  console.log("STATE", state)
  return {
    project: state.projects[props.match.params.id]
  }
}

const mapDispatchToProps = dispatch => {
  return {
    actions: bindActionCreators(projectActions, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ProjectDetail);
