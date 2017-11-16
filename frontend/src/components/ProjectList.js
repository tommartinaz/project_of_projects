import React, { Component } from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import { Card, Button, CardTitle, CardText, CardBody } from 'reactstrap';
import { Link } from 'react-router-dom';
import _ from 'lodash';

class ProjectList extends Component {

    ProjectList() {
        console.log("THIS.PROPS.PROJECTS", this)
        return _.map(this.props.projects, project => {
          const className = project.is_capstone_worthy ? 'blue-grey darken-1' : '';
          const textColor = project.is_capstone_worthy ? 'white' : 'black';
            return (
              <div>
                {project.business_name &&
                    <Card
                      className={className}
                      style={styles.cardStyle}>
                      <CardBody>
                        <CardTitle>{project.proj_name}</CardTitle>
                        <CardText style={{color: textColor}}>
                          Description: {project.short_desc}<br/>
                          Tech Stack: {project.tech_stack}<br/>
                          Business Name: {project.business_name}<br/>
                          <Link
                            to={`/projects/${project.id}`}
                          >
                            <Button size='sm'>Details</Button>
                          </Link>
                        </CardText>
                      </CardBody>
                    </Card>
                }
              </div>
            )

        })
    }
    render() {
        return (
            <div>
                {this.ProjectList()}
            </div>
        )
    }
}

const styles = {
  cardStyle: {
    width: '25vw'
  }
}

const mapStateToProps = state => {
  console.log("STATE.PROJECTS", state.projects)
    return {
        projects: state.projects
    }
}


  export default connect(mapStateToProps)(ProjectList);
