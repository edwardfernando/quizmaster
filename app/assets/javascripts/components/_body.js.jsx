var Body = React.createClass({
  getInitialState() {
    return {id: [], question: [], score: 0, answerStatus: []}
  },

  componentDidMount() {
    this.generateRandomQuestion();
  },

  generateRandomQuestion() {
    currentScore = this.state.score;
    $.getJSON('/api/v1/questions/random.json', (response) => {
      this.setState({id: response.id, question: response.question, answerStatus: []})
    });
  },

  updateScore() {
    this.setState({
      score: this.state.score + 1
    });
  },

  updateAnswerStatus(status) {
    this.setState({
      answerStatus: "Your Answer is " + status
    });
  },

  render() {
    return (
      <div>
        <Quiz 
          id={this.state.id} 
          score={this.state.score} 
          question={this.state.question} 
          answerStatus={this.state.answerStatus} 
          randomQuestion={this.generateRandomQuestion} 
          updateScore={this.updateScore} 
          updateAnswerStatus={this.updateAnswerStatus}/>
      </div>
    )
  }
});
