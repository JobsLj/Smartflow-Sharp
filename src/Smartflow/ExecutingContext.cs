﻿/********************************************************************
 License: https://github.com/chengderen/Smartflow/blob/master/LICENSE 
 Home page: https://www.smartflow-sharp.com
 ********************************************************************
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Smartflow.Elements;
using System.Dynamic;
using Smartflow.Enums;

namespace Smartflow
{
    /// <summary>
    /// 工作流执行下文参数封装
    /// </summary>
    public class ExecutingContext
    {
        /// <summary>
        /// 当前节点
        /// </summary>
        public ASTNode From
        {
            get;
            set;
        }

        /// <summary>
        /// 跳转到节点
        /// </summary>
        public ASTNode To
        {
            get;
            set;
        }

        /// <summary>
        /// 跳转路线ID
        /// </summary>
        public string TransitionID
        {
            get;
            set;
        }

        /// <summary>
        /// 当前参与执行者ID
        /// </summary>
        public string ActorID
        {
            get;
            set;
        }

        /// <summary>
        /// 当前参与执行者名称
        /// </summary>
        public string ActorName
        {
            get;
            set;
        }

        /// <summary>
        /// 工作流实例
        /// </summary>
        public WorkflowInstance Instance
        {
            get;
            set;
        }

        /// <summary>
        /// 传递数据
        /// </summary>
        public dynamic Data
        {
            get;
            set;
        }

        /// <summary>
        /// 操作方式
        /// </summary>
        public WorkflowAction Operation
        {
            get;
            internal set;
        }
    }
}
