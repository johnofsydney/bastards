module CandidatesHelper
  def safe_link_to(record)
    return '' unless record.present?
    return link_to(record.name, record) if record.name.present?
    return link_to 'unknown', record if record
    return ''
  end
end
