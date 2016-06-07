class Question extends React.Component {
  render () {
    return (
      <div>
        <div>Tag: {this.props.tag}</div>
        <div>Marks: {this.props.marks}</div>
      </div>
    );
  }
}

Question.defaultProps = {
  tag: "Lorem Ipsum",
  marks: 10
}

Question.propTypes = {
  tag: React.PropTypes.node,
  marks: React.PropTypes.number
};
