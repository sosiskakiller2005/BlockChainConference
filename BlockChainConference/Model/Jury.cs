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
    
    public partial class Jury
    {
        public Jury()
        {
            this.Activity = new HashSet<Activity>();
        }
    
        public int Id { get; set; }
        public string Email { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string CountryId { get; set; }
        public string Phone { get; set; }
        public int DirectionId { get; set; }
        public string Password { get; set; }
        public string Photo { get; set; }
    
        public virtual ICollection<Activity> Activity { get; set; }
        public virtual Country Country { get; set; }
        public virtual Direction Direction { get; set; }
    }
}
