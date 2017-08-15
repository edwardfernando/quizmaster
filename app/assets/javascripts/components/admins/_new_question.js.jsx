var NewQuestion = React.createClass({
  handleClick() {
    var question = this.refs.question.value;
    var answer = this.refs.answer.value;
    $.ajax({
      url: '/api/v1/questions',
      type: 'POST',
      data: {
        question: {
          question: question,
          answer: answer
        }
      },
      success: (question) => {
        this.props.handleSubmit(question);
      }
    });
  },
  render() {
    return (
      <div>
        <input ref='question' placeholder='Enter Question'/>
        <input ref='answer' placeholder='Enter Answer'/>
        <button onClick={this.handleClick}>Submit</button>
      </div>
    )
  }
});