using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BehaveYourself
{
    public class Ranker
    {
        public string rank { get; set; }
        public string user { get; set; }
        public string aggregate_score { get; set; }
        public Ranker(string rank, string user_id, string score)
        {
            this.rank = rank;
            this.user = user_id;
            this.aggregate_score = score;
        }
    }
}