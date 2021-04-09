import React from 'react';
import {BrowserRouter as Router} from 'react-router-dom'
import {DataProvider} from './GlobalState'
import Header from './components/Header/Header'
import MainPages from './components/mainpages/Pages'


function App() {
  return (
    <DataProvider>
      <Router>
      <Header/>
      <div className="App">
        
        <MainPages/>
        </div>
      </Router>
    </DataProvider>
  );
}

export default App;