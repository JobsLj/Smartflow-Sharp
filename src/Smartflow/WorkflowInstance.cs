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
using Smartflow.Dapper;
using System.Data;
using Smartflow.Enums;

namespace Smartflow
{
    public class WorkflowInstance : Infrastructure
    {
        protected WorkflowInstance()
        {
        }

        public WorkflowInstanceState State
        {
            get;
            set;
        }

        public WorkflowNode Current
        {
            get;
            set;
        }

        public string InstanceID
        {
            get;
            set;
        }

        public string STRUCTUREID
        {
            get;
            set;
        }

        public string STRUCTUREXML
        {
            get;
            set;
        }

        /// <summary>
        /// 获取流程实例
        /// </summary>
        /// <param name="instanceID">实例ID</param>
        /// <returns>流程实例</returns>
        public static WorkflowInstance GetInstance(string instanceID)
        {
            WorkflowInstance workflowInstance = new WorkflowInstance();
            workflowInstance.InstanceID = instanceID;
            string sql = ResourceManage.GetString(ResourceManage.SQL_WORKFLOW_INSTANCE);
            try
            {
                workflowInstance = workflowInstance.Connection.Query<WorkflowInstance, ASTNode, WorkflowInstance>(sql, (instance, node) =>
                {
                    instance.Current = WorkflowNode.ConvertToReallyType(node);
                    return instance;

                }, param: new { INSTANCEID = instanceID }, splitOn: "APPELLATION").FirstOrDefault<WorkflowInstance>();

                return workflowInstance;
            }
            catch (Exception ex)
            {
                throw new WorkflowException(ex, instanceID);
            }
        }

        /// <summary>
        /// 进行流程跳转
        /// </summary>
        /// <param name="transitionTo">选择跳转路线</param>
        internal void Jump(string transitionTo)
        {
            string update = " UPDATE T_INSTANCE SET RNID=@RNID WHERE INSTANCEID=@INSTANCEID ";
            Connection.Execute(update, new
            {
                RNID = transitionTo,
                INSTANCEID = InstanceID
            });
        }

        /// <summary>
        /// 状态转换
        /// </summary>
        internal void Transfer()
        {
            string update = " UPDATE T_INSTANCE SET STATE=@STATE WHERE INSTANCEID=@INSTANCEID ";
            Connection.Execute(update, new
            {
                STATE = State.ToString(),
                INSTANCEID = InstanceID
            });
        }

        internal static string CreateWorkflowInstance(string nodeID, string structureID, string structureXml)
        {
            WorkflowInstance instance = new WorkflowInstance();
            string instanceID = Guid.NewGuid().ToString();
            string sql = "INSERT INTO T_INSTANCE(INSTANCEID,RNID,STRUCTUREID,STATE,STRUCTUREXML) VALUES(@INSTANCEID,@RNID,@STRUCTUREID,@STATE,@STRUCTUREXML)";

            instance.Connection.Execute(sql, new
            {
                INSTANCEID = instanceID,
                RNID = nodeID,
                STRUCTUREID = structureID,
                STATE = WorkflowInstanceState.Running.ToString(),
                STRUCTUREXML = structureXml
            });

            instance.LogService.Info(string.Format("执行{0}方法创建实例,实例ID:{1}", "CreateWorkflowInstance", instanceID));

            return instanceID;
        }
    }
}
