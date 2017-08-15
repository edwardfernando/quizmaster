var Question = React.createClass({

  getInitialState() {
    return {editable: false}
  },
  handleEdit() {
    if (this.state.editable) {
      var id = this.props.question.id;
      var question = this.refs.question.value;
      var answer = this.refs.answer.value;
      var question = {
        id: id,
        question: question,
        answer: answer
      };
      this.props.handleUpdate(question);
    }
    this.setState({
      editable: !this.state.editable
    })
  },

  render() {
    var question = this.state.editable
      ? <input type='text' ref='question' defaultValue={this.props.question.question}/>
    : <span>{this.props.question.question}</span>;
    var answer = this.state.editable
      ? <input type='text' ref='answer' defaultValue={this.props.question.answer}/>
    : <span><em>{this.props.question.answer}</em></span>;

    return (
      <div>
        {question} / {answer}
        <button onClick={this.props.handleDelete}>Delete</button>
        <button onClick={this.handleEdit}>
          {this.state.editable
            ? 'Submit'
            : 'Edit'}
        </button>
      </div>
    )
  }
});