// action = {
//   type: 'CREATE_EVENT',
//   title: '東京オリンピックのお知らせ',
//   body: '開催します！つきましては、、'
// }
// state = []
// state = [
//   { id: 1, title: 'タイトル', body: 'ボディー1' }
//     { id: 2, title: 'タイトル', body: 'ボディー2' }
//       { id: 3, title: 'タイトル', body: 'ボディー3' }
// ]
const events = (state = [], action) => {
  switch (action.type) {
    case 'CREATE_EVENT':
      const event = { title: action.title, body: action.body }
      const length = state.length
      let id
      if (length === 0) {
        id = 1
      } else {
        id = state[length - 1].id + 1
      }
      return [...state, { id, ...event }]
    case 'CREATE_EVENT':
      return state
    case 'DELETE_ALL_EVENTS':
      return []
    default:
      return state
  }
}

export default events