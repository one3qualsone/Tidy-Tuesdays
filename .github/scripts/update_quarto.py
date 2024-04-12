import os
import yaml

def update_quarto_config():
    # Load existing Quarto config
    with open('website/_quarto.yml', 'r') as file:
        quarto_config = yaml.safe_load(file)

    # Read weeks
    weeks = sorted(next(os.walk('weekly_challenges'))[1])

    # Ensure the structure for Weekly Challenges exists
    weekly_contents = []
    for week in weeks:
        week_entry = {
            'href': f'../weekly_challenges/{week}/app.qmd',
            'text': f'Week {int(week[4:])}'  # Assuming week folder names like 'week1', 'week2', etc.
        }
        weekly_contents.append(week_entry)

    # Find or create the Weekly Challenges section
    weekly_challenges_section = next(
        (item for item in quarto_config['website']['sidebar']['contents'] if item.get('section') == 'Weekly Challenges'),
        None
    )

    if weekly_challenges_section:
        # Update existing section
        weekly_challenges_section['contents'] = [{
            'section': '2024',
            'contents': weekly_contents
        }]
    else:
        # Add new section if it doesn't exist
        quarto_config['website']['sidebar']['contents'].append({
            'section': 'Weekly Challenges',
            'contents': [{
                'section': '2024',
                'contents': weekly_contents
            }]
        })

    # Save the updated Quarto config
    with open('website/_quarto.yml', 'w') as file:
        yaml.safe_dump(quarto_config, file, default_flow_style=False, sort_keys=False)

if __name__ == '__main__':
    update_quarto_config()
