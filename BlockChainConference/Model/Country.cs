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
    
    public partial class Country
    {
        public Country()
        {
            this.Jury = new HashSet<Jury>();
            this.Moderator = new HashSet<Moderator>();
            this.Organizer = new HashSet<Organizer>();
            this.Participant = new HashSet<Participant>();
        }
    
        public string Code { get; set; }
        public string Name { get; set; }
        public string EnglishName { get; set; }
        public string LetterCode { get; set; }
    
        public virtual ICollection<Jury> Jury { get; set; }
        public virtual ICollection<Moderator> Moderator { get; set; }
        public virtual ICollection<Organizer> Organizer { get; set; }
        public virtual ICollection<Participant> Participant { get; set; }
    }
}
