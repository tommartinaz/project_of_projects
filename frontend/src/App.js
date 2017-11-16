import React, { Component } from 'react';
import './App.css';
import {Route, Router, Link} from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import createHistory from 'history/createBrowserHistory';
import { Button, Card, CardText, CardBody, CardTitle, CardSubtitle } from 'reactstrap';

import ProjectList from './components/ProjectList';
import ProjectDetail from './components/ProjectDetail';
import HomePage from './components/HomePage';
import NewProject from './components/NewProject';
import ProjectEdit from './components/ProjectEdit';
import * as projectActions from './actions/project_actions'
import * as locationActions from './actions/location_actions';

class App extends Component {
  componentDidMount() {
      this.props.actions.fetch_projects();
      this.props.actions.fetch_locations();
  }
  render() {
    const history = createHistory();

    return (
      <Router history={history}>
        <div>
          <Route exact path='/' component={HomePage} />
          <Route exact path='/projects' component={ProjectList} type='DS' />
          <Route path='/projects/new_project' component={NewProject} />
          <Route exact path='/projects/:id' component={ProjectDetail} />
          <Route exact path='/projects/edit/:id' component={ProjectEdit} />
        </div>
      </Router>
    );
  }
}

const mapDispatchToProps = dispatch => {
  return {
    actions: bindActionCreators(Object.assign({}, projectActions, locationActions), dispatch)
  }
}

export default connect(null, mapDispatchToProps)(App);
