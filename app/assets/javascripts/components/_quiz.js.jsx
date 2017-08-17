var Quiz = React.createClass({
  handleClick(){
      var answer = this.refs.answer.value;
      var id = this.props.id;
      $.ajax({
        url: '/api/v1/questions/'+id+'/check_answer.json',
        type: 'POST',
        data: {
          answer: answer
        },  
        success: (response) => {
          if(response.status) {
            this.props.updateScore();
            this.props.updateAnswerStatus("Correct");
          } else {
            this.props.updateAnswerStatus("Incorrect");
          }
        }
      });
  },
  
  handleRandomQuestion() {
    this.refs.answer.value = "";
    this.props.randomQuestion();
  },
  
  render() {
    return(
      <div>
        <p>{this.props.question}</p>
        <p>Current Score: {this.props.score}</p>
        <input ref="answer" placeholder="What's your guess?" />
        <button onClick={this.handleClick}>Submit</button>
        <button onClick={this.handleRandomQuestion}>Next Random Question</button>
        <p>{this.props.answerStatus}</p>
      </div>
    )
  }
});