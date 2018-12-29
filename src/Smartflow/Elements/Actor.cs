﻿/********************************************************************
 License: https://github.com/chengderen/Smartflow/blob/master/LICENSE 
 Home page: https://www.smartflow-sharp.com
 ********************************************************************
 */
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Smartflow.Dapper;
using Smartflow.Enums;
using Newtonsoft.Json;
using System.Xml.Serialization;

namespace Smartflow.Elements
{
    public class Actor : Element, IRelationShip
    {
        public string RNID
        {
            get;
            set;
        }

        public WorkflowAction OPERATION
        {
            get;
            set;
        }

        internal override void Persistent()
        {
            string sql = "INSERT INTO T_ACTOR(NID,IDENTIFICATION,RNID,APPELLATION,INSTANCEID,OPERATION) VALUES(@NID,@IDENTIFICATION,@RNID,@APPELLATION,@INSTANCEID,@OPERATION)";
            DapperFactory.CreateWorkflowConnection().Execute(sql, new
            {
                NID = Guid.NewGuid().ToString(),
                IDENTIFICATION = IDENTIFICATION,
                RNID = RNID,
                APPELLATION = APPELLATION,
                INSTANCEID = INSTANCEID,
                OPERATION = OPERATION
            });
        }
    }
}
