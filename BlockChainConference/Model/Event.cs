//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BlockChainConference.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Event
    {
        public Event()
        {
            this.Activity = new HashSet<Activity>();
            this.EventParticipant = new HashSet<EventParticipant>();
            this.Moderator = new HashSet<Moderator>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public System.DateTime Date { get; set; }
        public int Days { get; set; }
        public int CityId { get; set; }
        public Nullable<int> OrganizerId { get; set; }
        public Nullable<int> DirectionId { get; set; }
    
        public virtual ICollection<Activity> Activity { get; set; }
        public virtual City City { get; set; }
        public virtual Organizer Organizer { get; set; }
        public virtual ICollection<EventParticipant> EventParticipant { get; set; }
        public virtual ICollection<Moderator> Moderator { get; set; }
        public virtual Direction Direction { get; set; }
    }
}