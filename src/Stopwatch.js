import React, { Component } from 'react'
import './Stopwatch.css'

// Stopwatchコンポーネントの定義
class Stopwatch extends Component{
    constructor(props){
        super(props)
        this.state = { // 初期値の設定
            isLive: false,
            curTime: 0,
            startTime: 0
        }
        this.timerId = 0
    }

    // マウントした時
    componentWillMount() {
        this.timerId = setInterval(e => {
            this.tick()
        },1000 )
    }

    // アンマウントした時
    componentWillUnmount() {
        clearInterval(this.thimerId)
    }

    // 毎秒実行される
    tick(){
        if (this.state.isLive){
            const v = new Date().getTime()
            this.setState({curTime: v})
        }
    }

    // 開始・停止ボタンを押した時
    clickHandler(e){
        // 停止する時
        if(this.state.isLive){
            this.setState({isLive: false})
            return
        }
        // 開始する時
        const v = new Date().getTime()
        this.setState({
            curTime: v,
            startTime: v,
            isLive: true
        })
    };

    // 時刻表示ディスプレイを返す
    getDisplay() {
        const s = this.state
        const delta = s.curTime - s.startTime
        const t = Math.floor(delta / 1000)
        const ss = t % 60
        const m = Math.floor(t / 60)
        const mm = m % 60
        const hh = Math.floor(mm / 60)
        const z = (unm) => {
            const s = '00' + String(num)
            return s.substr(s.length - 2, 2)
        }
        return <span className='disp'>
            {z(hh)}:{z(mm)}:{z(ss)}
        </span>
    }

    // 画面描画
    render() {
        let label = 'START'
        if (this.state.isLive) {
            label = 'STOP'
        }
        const disp = this.getDisplay()
        const fclick = (e) => this.clickHandler(e)
        return (<div className='Stopwatch'>
            <div>{disp}</div>
            <button onClick={fclick}></button>
        </div>)
    }
}

export default Stopwatch