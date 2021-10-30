<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Pragma" content="no-catche" />
		<!-- <link rel="stylesheet" type="text/css" href="static/css/user/user.css" /> -->
		<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.1.1/jquery.min.js"></script>
		<script src="static/js/index/echarts.js"></script>
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			html {
				height: 100%;
			}

			body {
				position: relative;
				font: 14px "微软雅黑", "宋体", "Arial Narrow", HELVETICA;
				-webkit-text-size-adjust: 100%;
				background-color: #3b3e47;
				color: #ffffff;
				overflow: auto;
				height: 100%;
			}

			li {
				list-style: none
			}

			a {
				text-decoration: none;
			}

			.right_box,
			.left_box_a,
			.left_box_b,
			.left_box_c {
				overflow: hidden;
				font-size: 20px;
				padding: 20px;
				background: rgb(127, 127, 127, 0.8);
				-webkit-box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7), 0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
				-moz-box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7), 0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
				box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7), 0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
				-webkit-box-shadow: 5px;
				-moz-border-radius: 5px;
				border-radius: 5px;
			}

			.right_box {
				position: absolute;
				top: 2%;
				right: 2%;
				width: 60%;
				height: 94%;
			}

			.left_box_a {
				position: absolute;
				top: 2%;
				left: 2%;
				width: 34%;
				height: 30%;
			}

			.left_box_b {
				position: absolute;
				top: 34%;
				left: 2%;
				width: 34%;
				height: 30%;
			}

			.left_box_c {
				position: absolute;
				top: 66%;
				left: 2%;
				width: 34%;
				height: 30%;
			}
		</style>
	</head>
	<body>
		<!-- 内容 -->
		<div class="left_box_a">

		</div>
		<div class="left_box_b">

		</div>
		<div class="left_box_c">
	
		</div>
		<div class="right_box">
			

		</div>
		<script type="text/javascript">
			$(function() {
				
				
				// 基于准备好的dom，初始化echarts实例
				var myChart_a = echarts.init($(".left_box_a").get(0));

				// 指定图表的配置项和数据
				var option_a = {
					title: {
						text: 'ECharts 入门示例'
					},
					tooltip: {},
					legend: {
						data: [{name:'销量',icon: 'circle', textStyle: {color: 'red'}}]
					},
					xAxis: {
						data: ['衬衫', '羊毛衫', '雪纺衫', '裤子', '高跟鞋', '袜子']
					},
					yAxis: {},
					series: [{
						name: '销量',
						type: 'bar',
						data: [5, 20, 36, 10, 10, 20]
					}]
				};

				// 使用刚指定的配置项和数据显示图表。
				myChart_a.setOption(option_a);


var myChart_b = echarts.init($(".left_box_b").get(0));

    option_b = {
        baseOption: {
            title : {
                text: '南丁格尔玫瑰图',
                subtext: '纯属虚构',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [
                {
                    name:'半径模式',
                    type:'pie',
                    roseType : 'radius',
                    label: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    lableLine: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data:[
                        {value:10, name:'rose1'},
                        {value:5, name:'rose2'},
                        {value:15, name:'rose3'},
                        {value:25, name:'rose4'},
                        {value:20, name:'rose5'},
                        {value:35, name:'rose6'},
                        {value:30, name:'rose7'},
                        {value:40, name:'rose8'}
                    ]
                },
                {
                    name:'面积模式',
                    type:'pie',
                    roseType : 'area',
                    data:[
                        {value:10, name:'rose1'},
                        {value:5, name:'rose2'},
                        {value:15, name:'rose3'},
                        {value:25, name:'rose4'},
                        {value:20, name:'rose5'},
                        {value:35, name:'rose6'},
                        {value:30, name:'rose7'},
                        {value:40, name:'rose8'}
                    ]
                }
            ]
        },
        media: [
            {
                option: {
                    legend: {
                        right: 'center',
                        bottom: 0,
                        orient: 'horizontal'
                    },
                    series: [
                        {
                            radius: [20, '50%'],
                            center: ['25%', '50%']
                        },
                        {
                            radius: [30, '50%'],
                            center: ['75%', '50%']
                        }
                    ]
                }
            },
            {
                query: {
                    minAspectRatio: 1
                },
                option: {
                    legend: {
                        right: 'center',
                        bottom: 0,
                        orient: 'horizontal'
                    },
                    series: [
                        {
                            radius: [20, '50%'],
                            center: ['25%', '50%']
                        },
                        {
                            radius: [30, '50%'],
                            center: ['75%', '50%']
                        }
                    ]
                }
            },
            {
                query: {
                    maxAspectRatio: 1
                },
                option: {
                    legend: {
                        right: 'center',
                        bottom: 0,
                        orient: 'horizontal'
                    },
                    series: [
                        {
                            radius: [20, '50%'],
                            center: ['50%', '30%']
                        },
                        {
                            radius: [30, '50%'],
                            center: ['50%', '70%']
                        }
                    ]
                }
            },
            {
                query: {
                    maxWidth: 500
                },
                option: {
                    legend: {
                        right: 10,
                        top: '15%',
                        orient: 'vertical'
                    },
                    series: [
                        {
                            radius: [20, '50%'],
                            center: ['50%', '30%']
                        },
                        {
                            radius: [30, '50%'],
                            center: ['50%', '75%']
                        }
                    ]
                }
            }
        ]
    };



    myChart_b.setOption(option_b);


  var myChart_c = echarts.init($(".left_box_c").get(0));
 
        // 指定图表的配置项和数据
        var option_c = {
            series: {
                type: 'sunburst',
                data: [{
                    name: 'A',
                    value: 10,
                    children: [{
                        value: 3,
                        name: 'Aa'
                    }, {
                        value: 5,
                        name: 'Ab'
                    }]
                }, {
                    name: 'B',
                    children: [{
                        name: 'Ba',
                        value: 4
                    }, {
                        name: 'Bb',
                        value: 2
                    }]
                }, {
                    name: 'C',
                    value: 3
                }]
            }
        };

 
        // 使用刚指定的配置项和数据显示图表。
        myChart_c.setOption(option_c);

			});
		</script>

	</body>
</html>
