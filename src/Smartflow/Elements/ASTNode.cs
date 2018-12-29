﻿/********************************************************************
 License: https://github.com/chengderen/Smartflow/blob/master/LICENSE 
 Home page: https://www.smartflow-sharp.com
 ********************************************************************
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using System.Data;

using Smartflow.Dapper;
using Smartflow.Enums;
using Newtonsoft.Json;


namespace Smartflow.Elements
{
    public class ASTNode : Element
    {
        [JsonProperty("unique")]
        [XmlAttribute("identification")]
        public override string IDENTIFICATION
        {
            get;
            set;
        }

        [JsonProperty("transitions")]
        [XmlElement(ElementName = "transition")]
        public virtual List<Transition> Transitions
        {
            get;
            set;
        }

        [XmlIgnore]
        public virtual WorkflowNodeCategeory NodeType
        {
            get;
            set;
        }

        internal override void Persistent()
        {
            NID = Guid.NewGuid().ToString();
            string sql = "INSERT INTO T_NODE(NID,IDENTIFICATION,APPELLATION,NODETYPE,INSTANCEID) VALUES(@NID,@IDENTIFICATION,@APPELLATION,@NODETYPE,@INSTANCEID)";
            Connection.ExecuteScalar<long>(sql, new
            {
                NID = NID,
                IDENTIFICATION = IDENTIFICATION,
                APPELLATION = APPELLATION,
                NODETYPE = NodeType.ToString(),
                INSTANCEID = INSTANCEID
            });
        }

        internal virtual List<Transition> QueryWorkflowNode(string NID)
        {
            string query = "SELECT * FROM T_TRANSITION WHERE RNID=@RNID";
            LogService.Info(string.Format("执行QueryWorkflowNode,查询实例RNID：{0} Query:{1}", NID, query));
            return Connection.Query<Transition>(query, new { RNID = NID })
                  .ToList();
        }

        /// <summary>
        /// 记录已经参与过审核人员的信息
        /// </summary>
        /// <param name="actorID"></param>
        /// <param name="actorName"></param>
        /// <param name="action"></param>
        internal virtual void SetActor(string actorID, string actorName, WorkflowAction action)
        {
            if (this.NodeType != WorkflowNodeCategeory.Decision)
            {
                Actor actor = new Actor();
                actor.IDENTIFICATION = actorID;
                actor.APPELLATION = actorName;
                actor.RNID = NID;
                actor.OPERATION = action;
                actor.INSTANCEID = INSTANCEID;
                actor.Persistent();
            }
        }
    }
}
